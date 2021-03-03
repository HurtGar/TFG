import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NewBlockFormComponent } from './new-block-form.component';

describe('NewBlockFormComponent', () => {
  let component: NewBlockFormComponent;
  let fixture: ComponentFixture<NewBlockFormComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ NewBlockFormComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(NewBlockFormComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
